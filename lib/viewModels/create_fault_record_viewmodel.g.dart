// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_fault_record_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateFaultRecordViewModel on _CreateFaultRecordViewModelBase, Store {
  late final _$titleControllerAtom = Atom(
      name: '_CreateFaultRecordViewModelBase.titleController',
      context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$descriptionControllerAtom = Atom(
      name: '_CreateFaultRecordViewModelBase.descriptionController',
      context: context);

  @override
  TextEditingController get descriptionController {
    _$descriptionControllerAtom.reportRead();
    return super.descriptionController;
  }

  @override
  set descriptionController(TextEditingController value) {
    _$descriptionControllerAtom.reportWrite(value, super.descriptionController,
        () {
      super.descriptionController = value;
    });
  }

  late final _$recordsAtom =
      Atom(name: '_CreateFaultRecordViewModelBase.records', context: context);

  @override
  List<FaultRecordModel> get records {
    _$recordsAtom.reportRead();
    return super.records;
  }

  @override
  set records(List<FaultRecordModel> value) {
    _$recordsAtom.reportWrite(value, super.records, () {
      super.records = value;
    });
  }

  late final _$selectedImagesAtom = Atom(
      name: '_CreateFaultRecordViewModelBase.selectedImages', context: context);

  @override
  List<Uint8List> get selectedImages {
    _$selectedImagesAtom.reportRead();
    return super.selectedImages;
  }

  @override
  set selectedImages(List<Uint8List> value) {
    _$selectedImagesAtom.reportWrite(value, super.selectedImages, () {
      super.selectedImages = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CreateFaultRecordViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isEditAtom =
      Atom(name: '_CreateFaultRecordViewModelBase.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$titleNumberAtom = Atom(
      name: '_CreateFaultRecordViewModelBase.titleNumber', context: context);

  @override
  int get titleNumber {
    _$titleNumberAtom.reportRead();
    return super.titleNumber;
  }

  @override
  set titleNumber(int value) {
    _$titleNumberAtom.reportWrite(value, super.titleNumber, () {
      super.titleNumber = value;
    });
  }

  late final _$pickNAddAsyncAction =
      AsyncAction('_CreateFaultRecordViewModelBase.pickNAdd', context: context);

  @override
  Future<void> pickNAdd() {
    return _$pickNAddAsyncAction.run(() => super.pickNAdd());
  }

  late final _$createFeultRecordAsyncAction = AsyncAction(
      '_CreateFaultRecordViewModelBase.createFeultRecord',
      context: context);

  @override
  Future<void> createFeultRecord(
      {required String title, required String description}) {
    return _$createFeultRecordAsyncAction.run(
        () => super.createFeultRecord(title: title, description: description));
  }

  late final _$updateFeultRecordAsyncAction = AsyncAction(
      '_CreateFaultRecordViewModelBase.updateFeultRecord',
      context: context);

  @override
  Future<void> updateFeultRecord(
      {required String title,
      required String description,
      required int index}) {
    return _$updateFeultRecordAsyncAction.run(() => super.updateFeultRecord(
        title: title, description: description, index: index));
  }

  late final _$_CreateFaultRecordViewModelBaseActionController =
      ActionController(
          name: '_CreateFaultRecordViewModelBase', context: context);

  @override
  void incrementTitleNumber() {
    final _$actionInfo =
        _$_CreateFaultRecordViewModelBaseActionController.startAction(
            name: '_CreateFaultRecordViewModelBase.incrementTitleNumber');
    try {
      return super.incrementTitleNumber();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoadingState() {
    final _$actionInfo =
        _$_CreateFaultRecordViewModelBaseActionController.startAction(
            name: '_CreateFaultRecordViewModelBase._changeLoadingState');
    try {
      return super._changeLoadingState();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsEditState() {
    final _$actionInfo = _$_CreateFaultRecordViewModelBaseActionController
        .startAction(name: '_CreateFaultRecordViewModelBase.changeIsEditState');
    try {
      return super.changeIsEditState();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearControllers() {
    final _$actionInfo = _$_CreateFaultRecordViewModelBaseActionController
        .startAction(name: '_CreateFaultRecordViewModelBase.clearControllers');
    try {
      return super.clearControllers();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImageToSelectedImages(int index) {
    final _$actionInfo =
        _$_CreateFaultRecordViewModelBaseActionController.startAction(
            name:
                '_CreateFaultRecordViewModelBase.removeImageToSelectedImages');
    try {
      return super.removeImageToSelectedImages(index);
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllSelectedImages() {
    final _$actionInfo =
        _$_CreateFaultRecordViewModelBaseActionController.startAction(
            name: '_CreateFaultRecordViewModelBase.removeAllSelectedImages');
    try {
      return super.removeAllSelectedImages();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteRecord(int index) {
    final _$actionInfo = _$_CreateFaultRecordViewModelBaseActionController
        .startAction(name: '_CreateFaultRecordViewModelBase.deleteRecord');
    try {
      return super.deleteRecord(index);
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initRecords() {
    final _$actionInfo = _$_CreateFaultRecordViewModelBaseActionController
        .startAction(name: '_CreateFaultRecordViewModelBase.initRecords');
    try {
      return super.initRecords();
    } finally {
      _$_CreateFaultRecordViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
descriptionController: ${descriptionController},
records: ${records},
selectedImages: ${selectedImages},
isLoading: ${isLoading},
isEdit: ${isEdit},
titleNumber: ${titleNumber}
    ''';
  }
}
