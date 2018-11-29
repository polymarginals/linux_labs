#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/workqueue.h>
#include <linux/interrupt.h>

#include <asm/io.h>

static void keyboard_intrpt_do_work(struct work_struct * work);

static char scancode;

/*
 * Для статического создания (на этапе компиляции) экземпляра действия используется макрос DECLARE_WORK:
 * В этом выражении создаётся экземпляр struct work_struct с именем name, с функцией-обработчиком func().
 */
static DECLARE_WORK(keyboard_intrpt_work, keyboard_intrpt_do_work);

/*
 * Эта функция вызывается ядром, поэтому в ней будут безопасны все действия,
 * которые допустимы в модулях ядра.
 */
static void keyboard_intrpt_do_work(struct work_struct * work) {
  pr_info("Scan Code %x %s\n", scancode & 0x7F,           // Command 0x60-0x7F: Write keyboard controller RAM
    scancode & 0x80 ? "Released" : "Pressed");
}

/*
 * Обработчик прерываний от клавиатуры. Он считывает информацию с клавиатуры
 * и передает ее менее критичной по времени исполнения части,
 * которая будет запущена сразу же, как только ядро сочтет это возможным.
 */
static irqreturn_t keyboard_intrpt_isr(int irq, void * dev_id) {
  scancode = inb(0x60);

  /*
   * schedule_work — действие планируется для немедленного выполнения и будет выполнено,
   * как только рабочий поток events, работающий на данном процессоре, перейдёт в состояние выполнения.
   */
  schedule_work(& keyboard_intrpt_work);

  return IRQ_HANDLED;
}

/*
 * Инициализация модуля
 */
static int __init keyboard_intrpt_init(void) {
 /*
 * Подставить свой обработчик (irq_handler) на IRQ 1.
 * IRQF_SHARED означает, что мы допускаем возможность совместного
 * обслуживания этого IRQ другими обработчиками.
 */
 // Захват прерывания
 return request_irq(1,  /* Номер IRQ */
   keyboard_intrpt_isr, /* Наш обработчик прерывания */
   IRQF_SHARED,         /* Флаг. Разрешить разделение (совместное использование) линии IRQ с другими PCI устройствами */
   "keyboard_intrpt",   /* Имя устройства, захватывающего прерывание */
   & scancode
 );
}

/*
 * Завершение работы
 */
static void __exit keyboard_intrpt_cleanup(void) {
  free_irq(1, & scancode);              /* Освобождается прерывание. Первый параметр - номер прерывания */
}

module_init(keyboard_intrpt_init);      /* Какую функцию выполнить при загрузке модуля */
module_exit(keyboard_intrpt_cleanup);   /* Выполнить единожды, во время выгрузки модуля */

MODULE_LICENSE("GPL"); // Лицензия GPL
