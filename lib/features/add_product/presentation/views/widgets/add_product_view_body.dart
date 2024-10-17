import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fruithupdashboard/core/utils/functions/build_error.dart';
import 'package:fruithupdashboard/core/widgets/custom_buttton.dart';
import 'package:fruithupdashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithupdashboard/features/add_product/domin/entities/add_product_entitie.dart';
import 'package:fruithupdashboard/features/add_product/presentation/views/widgets/is_featured_item_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  bool isFeatured = false;
  late String name, description, code;
  late num price;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
            key: _formKey,
            autovalidateMode: _autovalidateMode,
            child: Column(
              children: [
                CustomTextFormField(
                  onSaved: (productName) {
                    name = productName!;
                  },
                  hintText: "Product Name",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (description) {
                    description = description!;
                  },
                  hintText: "Product Description",
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    price = num.parse(value!);
                  },
                  hintText: "Product Price",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    code = value!.toLowerCase();
                  },
                  hintText: "Product code",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                IsFeaturedItemWidget(
                  onChanged: (value) {
                    isFeatured = value;
                  },
                ),
                const SizedBox(height: 16),
                ImageField(
                  onFileChanged: (image) {
                    fileImage = image;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                    onTap: () {
                      if (fileImage != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          AddProductEntity productEntity = AddProductEntity(
                              name: name,
                              code: code,
                              image: fileImage!,
                              description: description,
                              price: price,
                              isFeatured: isFeatured);
                        }
                      } else {
                        buildErrorFunction(
                            message: 'Please upload an image',
                            type: ToastType.error);
                      }
                    },
                    text: "Add Product"),
                const SizedBox(height: 24),
              ],
            )),
      ),
    );
  }
}

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File> onFileChanged;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? file;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: InkWell(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImageMethod();
          } catch (e) {
            // TODO
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: file != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(file!))
                  : const Icon(
                      Icons.image_outlined,
                      size: 200,
                    ),
            ),
            Visibility(
              visible: file != null,
              child: IconButton(
                  onPressed: () {
                    file = null;
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImageMethod() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    file = File(image!.path);
    widget.onFileChanged(file!);
  }
}
