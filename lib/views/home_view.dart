import 'dart:typed_data';

import 'package:fault_tracking_frontend/viewModels/create_fault_record_viewmodel.dart';
import 'package:fault_tracking_frontend/views/create_fault_record_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: public_member_api_docs
class FaultListView extends StatefulWidget {
  // ignore: public_member_api_docs
  const FaultListView({super.key});

  @override
  State<FaultListView> createState() => _FaultListViewState();
}

class _FaultListViewState extends State<FaultListView> {
  final CreateFaultRecordViewModel viewModel = CreateFaultRecordViewModel();

  void _navigateToCreateFeultRecordView(BuildContext context) {
    Navigator.push(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => CreateFaultRecordView(viewModel: viewModel),
      ),
    );
  }

  void _navigateToUpdateFeultRecordView(BuildContext context, int index) {
    Navigator.push(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => CreateFaultRecordView(
          viewModel: viewModel,
          isEdit: true,
          index: index,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    viewModel.initRecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text('Arıza kayıtları (${viewModel.records.length})');
          },
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildNavigateButton(context),
          Expanded(
            child: Observer(
              builder: (_) {
                return ListView.separated(
                  itemCount: viewModel.records.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: _buildListTileItem(index, context),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }

  ListTile _buildListTileItem(int index, BuildContext context) {
    final record = viewModel.records[index];
    return ListTile(
      title: Text(record.title),
      subtitle: Text(record.description),
      trailing: _popupMenu(context, index),
      leading: record.images.isNotEmpty
          ? SizedBox(
              height: 40,
              width: 40,
              child: Image.memory(
                record.images.first as Uint8List,
              ),
            )
          : const Icon(Icons.image_not_supported),
    );
  }

  Widget _buildNavigateButton(BuildContext context) {
    return IconButton(
      onPressed: () => _navigateToCreateFeultRecordView(context),
      icon: const Icon(Icons.add_circle_rounded),
      iconSize: 48,
    );
  }

  Widget _popupMenu(BuildContext context, int index) {
    return SizedBox(
      child: PopupMenuButton<PopupMenuValues>(
        itemBuilder: (context) => [
          const PopupMenuItem(
            height: 24,
            value: PopupMenuValues.delete,
            child: Text('Sil'),
          ),
          const PopupMenuItem(
            height: 24,
            value: PopupMenuValues.update,
            child: Text('Güncelle'),
          ),
        ],
        onSelected: (value) {
          switch (value) {
            case PopupMenuValues.delete:
              _deleteDialog(context, index);
            case PopupMenuValues.update:
              _navigateToUpdateFeultRecordView(context, index);
          }
        },
      ),
    );
  }

  void _deleteDialog(BuildContext context, int index) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Silmek istediğinize emin misiniz?'),
        content: const Text('Gönderi kalıcı olarak silinecektir!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('İptal'),
          ),
          TextButton(
            onPressed: () {
              viewModel.deleteRecord(index);
              Navigator.pop(context, 'OK');
            },
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }
}

enum PopupMenuValues { update, delete }
