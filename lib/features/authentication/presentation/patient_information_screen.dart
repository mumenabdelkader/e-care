import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
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
                  _buildTextField(_firstNameController, "Enter first name"),

                  const VerticalSpacing(16),
                  _buildLabel("Last Name"),
                  _buildTextField(_lastNameController, "Enter last name"),

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
                    hint: const Text("Select gender"),
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Date of Birth"),
                  CustomTextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: _inputDecoration().copyWith(
                      hintText: "mm/dd/yyyy",
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),

                  const VerticalSpacing(16),
                  _buildLabel("Address"),
                  _buildTextField(_addressController, "Enter address"),

                  const VerticalSpacing(16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("Province"),
                            _buildTextField(
                              _provinceController,
                              "Enter province",
                            ),
                          ],
                        ),
                      ),
                      const HorizontalSpacing(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel("City"),
                            _buildTextField(_cityController, "Enter city"),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const VerticalSpacing(24),
                  CustomButton(
                    lable: Text("Save", style: AppStyles.font14W700White),
                    onPressed: () {},
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

  Widget _buildTextField(TextEditingController controller, String hint) {
    return CustomTextFormField(
      controller: controller,
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
