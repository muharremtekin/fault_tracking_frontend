import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


import 'components/custom_text_field.dart';
import 'components/list_image_item.dart';
import 'create_fault_record_viewmodel.dart';

class CreateFeultRecordView extends StatefulWidget {
  final CreateFaultRecordViewModel viewModel;
  final bool isEdit;
  final int index;
  const CreateFeultRecordView({
    super.key,
    required this.viewModel,
    this.isEdit = false,
    this.index = -1,
  });

  @override
  State<CreateFeultRecordView> createState() => _CreateFeultRecordViewState();
}

class _CreateFeultRecordViewState extends State<CreateFeultRecordView> {
  late final TextEditingController titleController = TextEditingController();

  late final TextEditingController descriptionController =
      TextEditingController();

  String _title = '';

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
  }

  void clearImages() {
    widget.viewModel.removeAllSelectedImages();
  }

  bool validateControllers() {
    return titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty;
  }

  void _setTexts() {
    if (widget.isEdit) {
      _title = 'Arıza kaydını düzenle';
      titleController.text = widget.viewModel.records[widget.index].title;
      descriptionController.text =
          widget.viewModel.records[widget.index].description;
      widget.viewModel.selectedImages
          .addAll(widget.viewModel.records[widget.index].images);
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      _showSnackbarMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void createFeultRecord(BuildContext context) async {
    if (validateControllers()) {
      final String title = titleController.text.trim();
      final String description = descriptionController.text.trim();
      widget.viewModel
          .createFeultRecord(
            title: title,
            description: description,
          )
          .whenComplete(
            () => Navigator.of(context).pop(),
          );
      clearControllers();
    } else {
      _showSnackbarMessage(
        context,
        message: 'Lütfen başlık ve açıklamayı doldurduğunuzdan emin olun!',
      );
      return;
    }
  }

  void updateFeultRecord(BuildContext context) async {
    if (validateControllers()) {
      final String title = titleController.text.trim();
      final String description = descriptionController.text.trim();
      widget.viewModel
          .updateFeultRecord(
            title: title,
            description: description,
            index: widget.index,
          )
          .whenComplete(
            () => Navigator.of(context).pop(),
          );
      clearControllers();
    } else {
      _showSnackbarMessage(
        context,
        message: 'Lütfen başlık ve açıklamayı doldurduğunuzdan emin olun!',
      );
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    _setTexts();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    clearImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(_title);
          },
        ),
      ),
      body: Observer(
        builder: (_) {
          return widget.viewModel.isLoading
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
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: CustomTextField(
              controller: titleController,
              hintText: 'örnek: 1. katta ışık yanmıyor',
              labelText: 'Arıza başlığı...',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: CustomTextField(
              controller: descriptionController,
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
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: ElevatedButton.icon(
                    onPressed: () => widget.viewModel.pickNAdd(),
                    icon: const Icon(Icons.image),
                    label: const Text('Galeriden seç'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Observer(builder: (_) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        widget.viewModel.incrementTitleNumber();
                      },
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Fotoğraf çek'),
                    );
                  }),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Observer(
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.isEdit) {
                        updateFeultRecord(context);
                      } else {
                        createFeultRecord(context);
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
    return widget.viewModel.selectedImages.isEmpty
        ? const SizedBox.shrink()
        : SizedBox(
            height: 100,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: widget.viewModel.selectedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListImageItem(
                    index: index,
                    onDelete: () {
                      widget.viewModel.removeImageToSelectedImages(index);
                    },
                    imageBytes: widget.viewModel.selectedImages[index],
                  ),
                );
              },
            ),
          );
  }
}
