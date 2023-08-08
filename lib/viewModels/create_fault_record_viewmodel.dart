import 'dart:math';
import 'dart:typed_data';

import 'package:fault_tracking_frontend/models/fault_record_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'i_viewmodel.dart';

part 'create_fault_record_viewmodel.g.dart';

// ignore: library_private_types_in_public_api, public_member_api_docs
class CreateFaultRecordViewModel = _CreateFaultRecordViewModelBase
    with _$CreateFaultRecordViewModel;

abstract class _CreateFaultRecordViewModelBase with Store implements IViewModel {
  @observable
  TextEditingController titleController = TextEditingController();

  @observable
  TextEditingController descriptionController = TextEditingController();

  @observable
  List<FaultRecordModel> records = ObservableList<FaultRecordModel>();

  @observable
  List<Uint8List> selectedImages = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  bool isEdit = false;

  @observable
  int titleNumber = 0;

  @action
  void incrementTitleNumber() => titleNumber++;

  @action
  void _changeLoadingState() {
    isLoading = !isLoading;
  }

  @action
  void changeIsEditState() {
    isEdit = !isEdit;
  }

  @action
  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
  }

  @action
  void removeImageToSelectedImages(int index) {
    selectedImages.removeAt(index);
  }

  @action
  void removeAllSelectedImages() {
    selectedImages.clear();
  }

  @action
  void deleteRecord(int index) {
    records.removeAt(index);
  }

  @action
  void initRecords() {
    for (var index = 0; index < 5; index++) {
      records.add(
        FaultRecordModel(
          id: Random().nextInt(1000),
          title: 'Arıza kaydı ${index + 1}',
          description: 'Arıza kaydı açıklaması ',
          images: [],
          status: false,
        ),
      );
    }
  }

  // mobx uint8list'i desteklemediği için yorum satırı yapıldı.
  @action
  Future<void> pickNAdd() async {
    // final bytesFromPicker = await ImagePickerWeb.getMultiImagesAsFile();

    // if (bytesFromPicker != null) {
    //   selectedImages.addAll(bytesFromPicker);
    // }
  }

  @action
  Future<void> createFeultRecord({
    required String title,
    required String description,
  }) async {
    _changeLoadingState();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    // final feultRecordModel = FaultRecordModel(
    //   id: DateTime.now().millisecondsSinceEpoch,
    //   title: title,
    //   description: description,
    //   images: selectedImages.toList(),
    // );
    // records.add(feultRecordModel);
    removeAllSelectedImages();
    _changeLoadingState();
  }

  @action
  Future<void> updateFeultRecord({
    required String title,
    required String description,
    required int index,
  }) async {
    _changeLoadingState();
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    // final feultRecordModel = FaultRecordModel(
    //   id: records[index].id,
    //   title: title,
    //   description: description,
    //   images: selectedImages.toList(),
    // );
    // records[index] = feultRecordModel;
    removeAllSelectedImages();
    _changeLoadingState();
  }
}
