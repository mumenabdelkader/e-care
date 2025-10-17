import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/profile/data/models/patient_request_body_model.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreatePatientProfileScreen extends StatefulWidget {
  const CreatePatientProfileScreen({super.key});

  @override
  State<CreatePatientProfileScreen> createState() =>
      _CreatePatientProfileScreenState();
}

class _CreatePatientProfileScreenState
    extends State<CreatePatientProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  String? _selectedGender;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    // 💡 تخصيص showDatePicker theme ليتوافق مع الوضع الداكن
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // لضمان أن الـ DatePicker يستخدم الـ primaryColor الخاص بك في كلا الوضعين
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface:
                  Theme.of(context).colorScheme.surface, // لون خلفية الـ dialog
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dobController.text = DateFormat('yyyy/MM/dd').format(pickedDate);
      });
    }
  }

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    // Defensive checks
    if (_selectedGender == null) {
      context.showSnackBar(
        "Please select your gender",
        backgroundColor: AppColors.red,
      );
      return;
    }
    if (_selectedDate == null) {
      context.showSnackBar(
        "Please select your date of birth",
        backgroundColor: AppColors.red,
      );
      return;
    }

    context.read<ProfileCubit>().createPatientPprofile(
      PatientRequestBodyModel(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        address:
            _addressController.text.trim().isEmpty
                ? null
                : _addressController.text.trim(),
        city:
            _cityController.text.trim().isEmpty
                ? null
                : _cityController.text.trim(),
        province:
            _provinceController.text.trim().isEmpty
                ? null
                : _provinceController.text.trim(),
        dateOfBirth: _selectedDate!,
        gender: _selectedGender!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // جلب TextTheme
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        // 💡 قبل: AppStyles.font22W700Black
        // 💡 الآن: textTheme.displayMedium
        title: Text("Patient Information", style: textTheme.displayMedium),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== Personal Section =====
                  _buildLabel("First Name", textTheme),
                  _buildTextField(
                    _firstNameController,
                    "Enter first name",
                    textTheme,
                    validator:
                        (value) =>
                            value == null || value.trim().isEmpty
                                ? "First name is required"
                                : null,
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Last Name", textTheme),
                  _buildTextField(
                    _lastNameController,
                    "Enter last name",
                    textTheme,
                    validator:
                        (value) =>
                            value == null || value.trim().isEmpty
                                ? "Last name is required"
                                : null,
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Gender", textTheme),
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration(context), // 💡 استخدام context
                    initialValue: _selectedGender,
                    // 💡 يجب تخصيص ستايل النصوص داخل الـ DropdownMenu
                    items:
                        ["Male", "Female"]
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(
                                  gender,
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? "Please select gender" : null,
                    hint: Text(
                      "Select gender",
                      style: textTheme.bodyMedium,
                    ), // 💡 تخصيص hint style
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Date of Birth", textTheme),
                  CustomTextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    validator:
                        (_) =>
                            _selectedDate == null
                                ? "Please select your date of birth"
                                : null,
                    // 💡 استخدام context
                    decoration: _inputDecoration(context).copyWith(
                      hintText: "mm/dd/yyyy",
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        color:
                            Theme.of(
                              context,
                            ).hintColor, // 💡 لون الأيقونة ديناميكي
                      ),
                    ),
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Address (Optional)", textTheme),
                  _buildTextField(
                    _addressController,
                    "Enter address",
                    textTheme,
                    validator: null,
                  ),

                  const VerticalSpacing(16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Province (Optional)", textTheme),
                            _buildTextField(
                              _provinceController,
                              "Enter province",
                              textTheme,
                              validator: null,
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpacing(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("City (Optional)", textTheme),
                            _buildTextField(
                              _cityController,
                              "Enter city",
                              textTheme,
                              validator: null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpacing(24),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is ProfileFailure) {
                        showErrorDialog(context, state.errorModel);
                      }
                      if (state is CreatedPatientProfileSuccess) {
                        context.showSnackBar(
                          state.data.message,
                          backgroundColor: AppColors.green,
                        );
                        context.pushAndRemoveUntil(
                          Routes.home,
                          predicate: (route) => false,
                        );
                      }
                    },
                    builder:
                        (context, state) => CustomButton(
                          lable:
                              state is ProfileLoading
                                  ? const Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.white,
                                    ),
                                  )
                                  : Text(
                                    'Continue',
                                    // 💡 النمط الثابت (White) يتم الحفاظ عليه في AppStyles
                                    style: AppStyles.font14W700White,
                                  ),
                          onPressed: state is ProfileLoading ? null : _onSave,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 💡 تم تعديل الدالة لتستخدم TextTheme
  Widget _buildLabel(String text, TextTheme textTheme) {
    return Text(
      text,
      style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
    );
  }

  // 💡 تم تعديل الدالة لتستخدم TextTheme
  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    TextTheme textTheme, {
    String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      controller: controller,
      validator: validator,
      label: Text(hint, style: textTheme.titleSmall), // 💡 استخدام titleSmall
      decoration: _inputDecoration(context).copyWith(hintText: hint),
      // 💡 تخصيص لون النص المدخل ديناميكياً
      style: textTheme.bodyMedium,
    );
  }

  // 💡 تم تعديل الدالة لتستخدم BuildContext لتعريف الألوان ديناميكياً
  InputDecoration _inputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      // 💡 لون خلفية حقل الإدخال ديناميكي
      fillColor: Theme.of(context).colorScheme.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      // 💡 لون الـ hint style ديناميكي
      hintStyle: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).hintColor),
    );
  }
}
