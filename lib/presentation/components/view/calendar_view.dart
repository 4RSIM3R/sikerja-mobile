import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  final List<DateTime> highlights;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onDateChanged;
  final ValueChanged<DateTime>? onPageChanged;
  final PageController? controller;
  final ValueChanged<PageController>? onCalendarCreated;

  const CalendarView({
    super.key,
    required this.firstDate,
    required this.lastDate,
    this.selectedDate,
    this.onDateChanged,
    this.onPageChanged,
    this.onCalendarCreated,
    this.controller,
    this.highlights = const <DateTime>[],
  });

  List<String> get highlightedDates => highlights.map((date) {
        return DateFormat('dd-MM-yyyy').format(date);
      }).toList();

  bool get focusIsHighlighted =>
      highlights.indexWhere((h) {
        return isSameDay(h, selectedDate);
      }) !=
      -1;

  List<int> get years => List<int>.generate(
        (lastDate.year - firstDate.year) + 1,
        (index) => firstDate.year + index,
      );

  List<int> get months {
    final m = List<int>.generate(12, (index) => index + 1);
    final cD = selectedDate ?? DateTime.now();

    if (![firstDate.year, lastDate.year].contains(cD.year)) return m;
    if (cD.year == lastDate.year) {
      return m.sublist(0, lastDate.month);
    }

    if (cD.year == firstDate.year) {
      return m.sublist(firstDate.month - 1, 11);
    }

    return m;
  }

  @override
  Widget build(BuildContext context) {
    const daysOfWeekStyle = DaysOfWeekStyle(
      weekendStyle: TextStyle(
        color: Colors.red,
      ),
    );
    final calendarStyle = CalendarStyle(
      markersAlignment: Alignment.center,
      holidayTextStyle: const TextStyle(
        color: Colors.red,
      ),
      holidayDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      todayTextStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      todayDecoration: ShapeDecoration(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      selectedTextStyle: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        decoration: TextDecoration.underline,
        decorationThickness: 1,
        color: Colors.transparent,
        decorationColor: Color(0xFF101010),
        shadows: [
          Shadow(
            // color: calendarStyle.holidayTextStyle.color!,
            offset: Offset(0, -2),
          ),
        ],
      ),
      selectedDecoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return TableCalendar(
      firstDay: firstDate,
      lastDay: lastDate,
      focusedDay: selectedDate ?? DateTime.now(),
      weekendDays: const [DateTime.sunday, DateTime.saturday],
      onCalendarCreated: onCalendarCreated,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        leftChevronIcon: SizedBox(
          height: 32,
          width: 32,
          child: ElevatedButton(
            onPressed: () {
              controller?.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              foregroundColor: const Color(0xFF051B44),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(
                  color: Color(0xFF051B44),
                  width: 0.75,
                ),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 18,
            ),
          ),
        ),
        rightChevronIcon: SizedBox(
          height: 32,
          width: 32,
          child: ElevatedButton(
            onPressed: () {
              controller?.nextPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              foregroundColor: const Color(0xFF051B44),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(
                  color: Color(0xFF051B44),
                  width: 0.75,
                ),
              ),
            ),
            child: const Icon(
              Icons.arrow_forward_outlined,
              size: 18,
            ),
          ),
        ),
      ),
      daysOfWeekStyle: daysOfWeekStyle,
      calendarStyle: calendarStyle,
      onDaySelected: (selected, focused) {
        onDateChanged?.call(selected);
      },
      onPageChanged: (day) {
        onPageChanged?.call(day);
      },
      holidayPredicate: (day) {
        return day.weekday == DateTime.sunday;
      },
      selectedDayPredicate: highlights.isEmpty
          ? null
          : (day) {
              for (final highlight in highlights) {
                if (isSameDay(day, highlight)) return true;
              }

              return isSameDay(day, selectedDate);
            },
      calendarBuilders: CalendarBuilders(
        headerTitleBuilder: (context, day) {
          return Row(
            children: [
              Expanded(
                child: PopupMenuButton<int>(
                  initialValue: day.month,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  position: PopupMenuPosition.under,
                  onSelected: (selected) {
                    onDateChanged?.call(DateTime(day.year, selected, selected, day.hour));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateFormat('MMMM').format(day)),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                  itemBuilder: (context) => months.map((month) {
                    return PopupMenuItem<int>(
                      value: month,
                      child: Text(DateFormat('MMMM').format(DateTime(day.year, month))),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: PopupMenuButton<int>(
                  initialValue: day.year,
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  position: PopupMenuPosition.under,
                  onSelected: (selected) {
                    onDateChanged?.call(DateTime(selected, day.month, day.day, day.hour));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(day.year.toString()),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 18,
                      ),
                    ],
                  ),
                  itemBuilder: (context) => years.map((year) {
                    return PopupMenuItem<int>(
                      value: year,
                      child: Text(year.toString()),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
        // Customize underline : https://stackoverflow.com/questions/61632949/is-it-possible-to-underline-text-with-some-height-between-text-and-underline-lin
        selectedBuilder: (context, day, focused) {
          final dayIsToday = isSameDay(day, DateTime.now());
          final dayIsSunday = day.weekday == DateTime.sunday;
          final dayIsHighlighted = highlights.indexWhere((h) {
                return isSameDay(h, day);
              }) !=
              -1;
          final focusedIsToday = isSameDay(focused, DateTime.now());
          final focusedIsSunday = focused.weekday == DateTime.sunday;
          final focusedIsSameDay = isSameDay(focused, day);

          final selectedColor = Theme.of(context).primaryColor.withOpacity(0.15);

          if (focusedIsToday && dayIsToday) {
            return Container(
              decoration: ShapeDecoration(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.day.toString(),
                    style: calendarStyle.todayTextStyle.copyWith(
                      color: calendarStyle.selectedTextStyle.decorationColor,
                    ),
                  ),
                ],
              ),
            );
          }

          //
          if (focusedIsSameDay && !focusedIsSunday && !focusedIsToday && !focusIsHighlighted) {
            return Container(
              decoration: ShapeDecoration(
                color: focusIsHighlighted ? const Color(0xFFF5F5F5) : ColorTheme.neutral[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ).copyWith(
                  side: !focusIsHighlighted
                      ? null
                      : BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: 1.5,
                        ),
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.day.toString(),
                    style: !focusIsHighlighted ? const TextStyle() : calendarStyle.selectedTextStyle,
                  ),
                ],
              ),
            );
          }

          // if selected dates is same day as focused date, and it's highlighted
          if (focusedIsSameDay && focusIsHighlighted) {
            return Container(
              decoration: ShapeDecoration(
                color: selectedColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.day.toString(),
                    style: !focusedIsSunday
                        ? calendarStyle.selectedTextStyle
                        : calendarStyle.selectedTextStyle.copyWith(
                            // color: calendarStyle.holidayTextStyle.color,
                            decorationColor: calendarStyle.holidayTextStyle.color,
                            shadows: [
                              Shadow(
                                color: calendarStyle.holidayTextStyle.color!,
                                offset: const Offset(0, -2),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            );
          }

          // if selected dates is sunday
          if (dayIsSunday) {
            return Container(
              decoration: dayIsHighlighted
                  ? calendarStyle.selectedDecoration
                  : ShapeDecoration(
                      color: selectedColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    day.day.toString(),
                    style: !dayIsHighlighted
                        ? calendarStyle.holidayTextStyle
                        : calendarStyle.selectedTextStyle.copyWith(
                            decorationColor: calendarStyle.holidayTextStyle.color,
                            shadows: [
                              Shadow(
                                color: calendarStyle.holidayTextStyle.color!,
                                offset: const Offset(0, -2),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            );
          }

          return Container(
            decoration: dayIsHighlighted
                ? calendarStyle.selectedDecoration
                : ShapeDecoration(
                    color: selectedColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day.day.toString(),
                  style: !dayIsHighlighted
                      ? calendarStyle.holidayTextStyle
                      : calendarStyle.selectedTextStyle.copyWith(
                          decorationColor: calendarStyle.holidayTextStyle.color,
                          shadows: [
                            Shadow(
                              color: calendarStyle.holidayTextStyle.color!,
                              offset: const Offset(0, -2),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
