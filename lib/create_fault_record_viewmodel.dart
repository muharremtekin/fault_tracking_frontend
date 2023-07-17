import 'dart:math';
import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:mobx/mobx.dart';

import 'fault_record_model.dart';

part 'create_fault_record_viewmodel.g.dart';

class CreateFaultRecordViewModel = _CreateFaultRecordViewModelBase
    with _$CreateFaultRecordViewModel;

abstract class _CreateFaultRecordViewModelBase with Store {
  @observable
  List<FaultRecordModel> records = ObservableList<FaultRecordModel>();

  @observable
  List<Uint8List> selectedImages = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  int titleNumber = 0;

  @action
  void incrementTitleNumber() => titleNumber++;

  @action
  void _changeLoadingState() {
    isLoading = !isLoading;
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
      records.add(FaultRecordModel(
        id: Random().nextInt(1000),
        title: 'Arıza kaydı ${index + 1}',
        description: 'Arıza kaydı açıklaması ',
        images: [],
      ));
    }
  }

  @action
  Future<void> pickNAdd() async {
    List<Uint8List>? bytesFromPicker =
        await ImagePickerWeb.getMultiImagesAsBytes();
    if (bytesFromPicker != null) {
      selectedImages.addAll(bytesFromPicker);
    }
  }

  @action
  Future<void> createFeultRecord({
    required String title,
    required String description,
  }) async {
    _changeLoadingState();
    await Future.delayed(const Duration(seconds: 1));
    final feultRecordModel = FaultRecordModel(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
      images: selectedImages.toList(),
    );
    records.add(feultRecordModel);
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
    await Future.delayed(const Duration(seconds: 1));
    final feultRecordModel = FaultRecordModel(
      id: records[index].id,
      title: title,
      description: description,
      images: selectedImages.toList(),
    );
    records[index] = feultRecordModel;
    removeAllSelectedImages();
    _changeLoadingState();
  }
}
