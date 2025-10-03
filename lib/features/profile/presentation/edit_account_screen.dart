import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _usernameController = TextEditingController(
    text: "zhafira",
  );
  final TextEditingController _firstNameController = TextEditingController(
    text: "Zhafira",
  );
  final TextEditingController _lastNameController = TextEditingController(
    text: "Azalea",
  );
  final TextEditingController _dobController = TextEditingController(
    text: "Feb 12, 1994",
  );
  final TextEditingController _phoneController = TextEditingController(
    text: "+201017480870",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "ma8510007@gmail.com",
  );
  final TextEditingController _cityController = TextEditingController(
    text: "Bandung",
  );
  final TextEditingController _provinceController = TextEditingController(
    text: "West Java",
  );
  final TextEditingController _addressController = TextEditingController(
    text: "Jl. Sekar Wangi 20 A, Bancangan",
  );

  String _selectedGender = "Female";
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

  void _pickProfilePhoto() {
    // TODO: implement with image_picker / file picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Change profile photo tapped")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account", style: AppStyles.font20W700Black),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ===== Profile Photo Section =====
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundColor: AppColors.softGrey,
                      backgroundImage: const NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw0JfCLG0-cgSR4OxwJxYjDmaDNTFLzKYpNw&s", // replace with user photo
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickProfilePhoto,
                        child: Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 18.sp,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              VerticalSpacing(24),

              // ===== Personal Section =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Personal", style: AppStyles.font16W700Grey),
              ),
              VerticalSpacing(16),
              _buildTextField("Username", _usernameController),
              _buildTextField("First Name", _firstNameController),
              _buildTextField("Last Name", _lastNameController),

              // Date of Birth
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Date of Birth", style: AppStyles.font12W400Grey),
              ),
              VerticalSpacing(4),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  filled: true,
                  fillColor: AppColors.softGrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              VerticalSpacing(16),

              // Gender
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Gender", style: AppStyles.font12W400Grey),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: "Female",
                      groupValue: _selectedGender,
                      onChanged:
                          (val) => setState(() => _selectedGender = val!),
                      title: const Text("Female"),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: "Male",
                      groupValue: _selectedGender,
                      onChanged:
                          (val) => setState(() => _selectedGender = val!),
                      title: const Text("Male"),
                    ),
                  ),
                ],
              ),
              VerticalSpacing(20),

              // ===== Contact Section =====
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Contact", style: AppStyles.font16W700Grey),
              ),
              VerticalSpacing(16),

              _buildTextField(
                "Phone Number",
                _phoneController,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                "Email",
                _emailController,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
              ),
              _buildTextField("City", _cityController),
              _buildTextField("Province", _provinceController),
              _buildTextField("Address", _addressController, maxLines: 2),

              VerticalSpacing(24),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {
                    if (state is ProfileFailure) {
                      showErrorDialog(context, state.errorModel);
                    }
                    if (state is ProfileUpdatedPatientSuccess) {
                      context.showSnackBar(
                        state.data.message ?? "Profile Updated Successfuly",
                        backgroundColor: AppColors.green,
                      );
                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      lable:
                          state is ProfileLoading
                              ? Center(child: CircularProgressIndicator())
                              : Text(
                                'Save Changes',
                                style: AppStyles.font14W700White,
                              ),
                      onPressed:
                          state is ProfileLoading ? null : _updateProfile,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateProfile() {
    context.read<ProfileCubit>().updatePatientPprofile(
      UpdataPatientProfileRequestBodyModel(
        userName: _usernameController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        address: _addressController.text,
        city: _cityController.text,
        province: _provinceController.text,
        //TODO send real dob
        dateOfBirth: _selectedDate ?? DateTime(2000),
        phoneNumber: _phoneController.text,

        gender: _selectedGender,
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool readOnly = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppStyles.font12W400Grey),
          VerticalSpacing(4),
          CustomTextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.softGrey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
