// ignore_for_file: prefer_final_fields, unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repositories/voucher/voucher_repository.dart';

import '../../models/models.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  VoucherRepository _voucherRepository;
  StreamSubscription? streamSubscription;
  VoucherBloc({required VoucherRepository voucherRepository})
      : _voucherRepository = voucherRepository,
        super(VoucherLoading()) {
    on<LoadVouchers>(_onLoadVouchers);
    on<UpdateVouchers>(_onUpdateVouchers);
    on<SelectVoucher>(_onSelectVouchers);
  }

  void _onLoadVouchers(LoadVouchers event, Emitter<VoucherState> emit) {}

  void _onUpdateVouchers(UpdateVouchers event, Emitter<VoucherState> emit) {}

  void _onSelectVouchers(SelectVoucher event, Emitter<VoucherState> emit) {}
}
