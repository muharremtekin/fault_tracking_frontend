// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fault_tracking_frontend/components/custom_text_field.dart';
import 'package:fault_tracking_frontend/components/list_image_item.dart';
import 'package:fault_tracking_frontend/viewModels/create_fault_record_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class CreateFaultRecordView extends StatelessWidget {
  final CreateFaultRecordViewModel viewModel;
  bool isEdit;
  int index;
  CreateFaultRecordView({
    super.key,
    required this.viewModel,
    this.isEdit = false,
    this.index = -1,
  });

  void clearImages() {
    viewModel.removeAllSelectedImages();
  }

  bool validateControllers() {
    return viewModel.titleController.text.trim().isNotEmpty &&
        viewModel.descriptionController.text.trim().isNotEmpty;
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _showSnackbarMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(
              viewModel.isEdit
                  ? 'Arıza kaydını düzenle'
                  : 'Arıza kaydı oluştur',
            );
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return viewModel.isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : _buildBody(context);
        },
      ),
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: CustomTextField(
              controller: viewModel.titleController,
              hintText: 'örnek: 1. katta ışık yanmıyor',
              labelText: 'Arıza başlığı...',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: CustomTextField(
              controller: viewModel.descriptionController,
              hintText:
                  'örnek: Elektrikler kesildikten sonra ışık bir daha yanmadı.',
              labelText: 'Açıklama...',
              maxLines: 5,
            ),
          ),
          Observer(
            builder: (_) {
              return _imageListViewBuilder();
            },
          ),
          // resim seçme ve fotoğraf çekme butonları
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: ElevatedButton.icon(
                    onPressed: viewModel.pickNAdd,
                    icon: const Icon(Icons.image),
                    label: const Text('Galeriden seç'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Observer(builder: (_) {
                    return ElevatedButton.icon(
                      onPressed: viewModel.incrementTitleNumber,
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Fotoğraf çek'),
                    );
                  },),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Observer(
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isEdit) {
                        // updateFeultRecord(context);
                      } else {
                        // createFeultRecord(context);
                      }
                    },
                    child: const Text('Kaydet'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageListViewBuilder() {
    return viewModel.selectedImages.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: viewModel.selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListImageItem(
                    index: index,
                    onDelete: () {
                      viewModel.removeImageToSelectedImages(index);
                    },
                    imageBytes: viewModel.selectedImages[index],
                  ),
                );
              },
            ),
          );
  }
}
