import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/routing/routes.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/authentication/data/models/patient_request_body_model.dart';
import 'package:clinic/features/authentication/presentation/controller/register/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PatientInformationScreen extends StatefulWidget {
  const PatientInformationScreen({super.key});

  @override
  State<PatientInformationScreen> createState() =>
      _PatientInformationScreenState();
}

class _PatientInformationScreenState extends State<PatientInformationScreen> {
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
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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

    context.read<AuthCubit>().createPatientPprofile(
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient Information", style: AppStyles.font22W700Black),
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
                  _buildLabel("First Name"),
                  _buildTextField(
                    _firstNameController,
                    "Enter first name",
                    validator:
                        (value) =>
                            value == null || value.trim().isEmpty
                                ? "First name is required"
                                : null,
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Last Name"),
                  _buildTextField(
                    _lastNameController,
                    "Enter last name",
                    validator:
                        (value) =>
                            value == null || value.trim().isEmpty
                                ? "Last name is required"
                                : null,
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Gender"),
                  DropdownButtonFormField<String>(
                    decoration: _inputDecoration(),
                    value: _selectedGender,
                    items:
                        ["Male", "Female"]
                            .map(
                              (gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
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
                    hint: const Text("Select gender"),
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Date of Birth"),
                  CustomTextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    validator:
                        (_) =>
                            _selectedDate == null
                                ? "Please select your date of birth"
                                : null,
                    decoration: _inputDecoration().copyWith(
                      hintText: "mm/dd/yyyy",
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Address (Optional)"),
                  _buildTextField(
                    _addressController,
                    "Enter address",
                    validator: null,
                  ),

                  const VerticalSpacing(16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Province (Optional)"),
                            _buildTextField(
                              _provinceController,
                              "Enter province",
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
                            _buildLabel("City (Optional)"),
                            _buildTextField(
                              _cityController,
                              "Enter city",
                              validator: null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpacing(24),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        showErrorDialog(context, state.errorModel);
                      }
                      if (state is AuthCreatePatientProfileSuccess) {
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
                              state is AuthLoading
                                  ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                  : Text(
                                    'Continue',
                                    style: AppStyles.font14W700White,
                                  ),
                          onPressed: state is AuthLoading ? null : _onSave,
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    String? Function(String?)? validator,
  }) {
    return CustomTextFormField(
      controller: controller,
      validator: validator,
      label: Text(hint, style: AppStyles.font12W400Grey),
      decoration: _inputDecoration().copyWith(hintText: hint),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }
}
