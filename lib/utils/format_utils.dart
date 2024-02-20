import 'package:intl/intl.dart';

extension ExtendedString on String {
  String get formatDate {
    return DateFormat("dd-MM-yyyy").format(DateTime.parse(this));
  }

  String get formatDateAll {
    return DateFormat("dd-MM-yyyy HH:mm").format(DateTime.parse(this));
  }

  String get formatDateToHours {
    return DateFormat("HH:mm").format(DateTime.parse(this));
  }

  String get formatMoney {
    return "${NumberFormat.currency(locale: 'ID')
            .format(double.parse(this))
            .replaceAll("IDR", "")} ₺";
  }

  String get formatMoneyForKpi {
    return "${NumberFormat.currency(locale: 'ID')
            .format(double.parse(this))
            .split(",")[0]
            .replaceAll("IDR", "")} ₺";
  }

  String get formatNumberToOneDigit {
    return NumberFormat("#,##0.0").format(double.parse(this));
  }
  String get formatDateRequest {
    return DateFormat("dd/MM/yyyy").format(DateTime.parse(this));
  }

  String get formatDateRequestYear {
    return DateFormat("yyyy-MM-dd").format(DateTime.parse(this));
  }

  String get formatDateRequestAddOneDay {
    return DateFormat("dd/MM/yyyy")
        .format(DateTime.parse(this).add(const Duration(days: 1)));
  }

  String get formatDateRequestYearAddOneDay {
    return DateFormat("yyyy-MM-dd")
        .format(DateTime.parse(this).add(const Duration(days: 1)));
  }
}
