import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'create_fault_record_view.dart';
import 'create_fault_record_viewmodel.dart';
import 'fault_record_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CreateFaultRecordViewModel viewModel = CreateFaultRecordViewModel();

  void _navigateToCreateFeultRecordView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateFeultRecordView(viewModel: viewModel),
      ),
    );
  }

  void _navigateToUpdateFeultRecordView(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateFeultRecordView(
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
                  scrollDirection: Axis.vertical,
                  itemCount: viewModel.records.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
    FaultRecordModel record = viewModel.records[index];
    return ListTile(
      title: Text(record.title),
      subtitle: Text(record.description),
      trailing: _popupMenu(context, index),
      leading: record.images.isNotEmpty
          ? SizedBox(
              height: 40,
              width: 40,
              child: Image.memory(
                record.images.first,
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
              break;
            case PopupMenuValues.update:
              _navigateToUpdateFeultRecordView(context, index);
              break;
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
