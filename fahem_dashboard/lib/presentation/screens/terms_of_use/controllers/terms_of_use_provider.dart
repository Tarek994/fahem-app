import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fahem_dashboard/core/error/failure.dart';
import 'package:fahem_dashboard/core/utilities/dependency_injection.dart';
import 'package:fahem_dashboard/core/utilities/enums.dart';
import 'package:fahem_dashboard/core/utilities/methods.dart';
import 'package:fahem_dashboard/data/models/terms_of_use_model.dart';
import 'package:fahem_dashboard/domain/usecases/base/base_usecase.dart';

class TermsOfUseProvider with ChangeNotifier {

  // region Get About App
  late TermsOfUseModel _termsOfUseModel;
  TermsOfUseModel get termsOfUseModel => _termsOfUseModel;
  setTermsOfUse(TermsOfUseModel termsOfUseModel) => _termsOfUseModel = termsOfUseModel;
  editTermsOfUse(TermsOfUseModel termsOfUseModel) {_termsOfUseModel = termsOfUseModel; notifyListeners();}

  DataState _dataState = DataState.loading;
  DataState get dataState => _dataState;
  setDataState(DataState dataState) => _dataState = dataState;
  changeDataState(DataState dataState) {_dataState = dataState; notifyListeners();}

  bool _isScreenDisposed = false;
  bool get isScreenDisposed => _isScreenDisposed;
  setIsScreenDisposed(bool isScreenDisposed) => _isScreenDisposed = isScreenDisposed;

  Future<void> fetchData() async {
    changeDataState(DataState.loading);
    Either<Failure, TermsOfUseModel> response = await DependencyInjection.getTermsOfUseUseCase.call(const NoParameters());
    if(isScreenDisposed) return;
    await response.fold((failure) async {
      Methods.showToast(failure: failure);
      changeDataState(DataState.error);
    }, (data) async {
      setTermsOfUse(data);
      changeDataState(DataState.done);
    });
  }

  void _resetVariablesToDefault() {
    setDataState(DataState.loading);
    setIsScreenDisposed(false);
  }

  Future<void> reFetchData() async {
    if(_dataState == DataState.loading) return;
    _resetVariablesToDefault();
    await fetchData();
  }
  // endregion
}