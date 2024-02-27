import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kabarakmarket/src/featureb/api/memory_repository.dart';
import 'package:kabarakmarket/src/featureb/models/memory.dart';
import 'package:kabarakmarket/src/utils/utils.dart';
import 'package:kabarakmarket/src/featurea/widgets/file_upload_field.dart';

class MemoryItemForm extends ConsumerStatefulWidget {
  const MemoryItemForm({this.data, super.key});

  final Memory? data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MemoryItemFormState();
}

class _MemoryItemFormState extends ConsumerState<MemoryItemForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? _autovalidateMode;
  bool _isSubmitting = false;

  late TextEditingController _titleCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _linkCtrl;
  late TextEditingController _priceCtrl;

  File? _file;

  @override
  void initState() {
    _titleCtrl = TextEditingController(text: widget.data?.title ?? '');
    _descCtrl = TextEditingController(text: widget.data?.description ?? '');
    _linkCtrl = TextEditingController(text: widget.data?.linkvid ?? '');
    _priceCtrl = TextEditingController(text: widget.data?.price ?? '');
    super.initState();
  }

  void _popView() {
    if (mounted) {
      context.pop();
    }
  }

  Future<void> _addMemory() async {
    if (_file == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(memoryRepositoryProvider).addMemory(
            title: _titleCtrl.text,
            description: _descCtrl.text,
            linkvid: _linkCtrl.text,
            price: _priceCtrl.text,
            file: _file!,
          );

      _popView();
    } catch (e) {
      _popView();

      context.showAlert(e.toString());
    }
  }

  Future<void> _updateMemory() async {
    if (widget.data == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(memoryRepositoryProvider).updateMemory(
            id: widget.data!.id,
            title: _titleCtrl.text,
            description: _descCtrl.text,
            linkvid: _priceCtrl.text,
            price: _linkCtrl.text,
          );

      _popView();
    } catch (e) {
      _popView();

      context.showAlert(e.toString());
    }
  }

  Future<void> _deleteMemory() async {
    if (widget.data == null) {
      return;
    }

    try {
      setState(() {
        _isSubmitting = true;
      });

      await ref.read(memoryRepositoryProvider).deleteMemory(widget.data!);

      _popView();
    } catch (e) {
      _popView();

      context.showAlert(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                widget.data == null
                    ? 'Upload Your Product'
                    : 'Edit The Product ',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _titleCtrl,
                readOnly: _isSubmitting,
                decoration: InputDecoration(
                  labelText: 'Product Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelStyle: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.red, width: 2),
                  ),
                  errorStyle: const TextStyle(fontSize: 14),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Product title';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _descCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
                maxLength: 500,
                // this allows for multiple lines
                maxLines: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Product Description';
                  }
                  final wordCount = RegExp(r'\w+').allMatches(value).length;
                  if (wordCount > 500) {
                    return 'Product description must be less than 500 words';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              //product video Link
              TextFormField(
                controller: _linkCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  labelText: 'Product Video',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter The product Video Link';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              //product Price
              TextFormField(
                controller: _priceCtrl,
                readOnly: _isSubmitting,
                decoration: const InputDecoration(
                  hintText: 'Enter product price',
                  labelText: 'Product Price',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Product Price';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 20),
              //  block to decide whether to show an image or a file upload field
              widget.data?.imageId != null
                  ? SizedBox(
                      height: 150,
                      child: Image.network(
                        ref.read(
                          imageUrlProvider(
                            userId: widget.data!.profileId,
                            filename: widget.data!.imageId,
                          ),
                        ),
                      ),
                    )
                  : FileUploadField(
                      readOnly: _isSubmitting,
                      onChanged: (file) {
                        setState(() {
                          _file = file;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an image';
                        }
                        return null;
                      },
                    ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _isSubmitting
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate() == false) {
                            setState(() {
                              _autovalidateMode = AutovalidateMode.always;
                            });
                          } else if (widget.data != null) {
                            _updateMemory();
                          } else {
                            _addMemory();
                          }
                        },
                  child: const Text('Submit'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _isSubmitting ? null : _deleteMemory,
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
