part of 'voucher_bloc.dart';

abstract class VoucherState extends Equatable {
  const VoucherState();

  @override
  List<Object> get props => [];
}

class VoucherLoading extends VoucherState {}

class VoucherLoaded extends VoucherState {
  final List<Voucher> vouchers;
  const VoucherLoaded({this.vouchers = const <Voucher>[]});

  @override
  List<Object> get props => [vouchers];
}

class VoucherSelected extends VoucherState {
  final List<Voucher> vouchers;
  const VoucherSelected({required this.vouchers});

  @override
  List<Object> get props => [vouchers];
}
