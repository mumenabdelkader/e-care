// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:clinic/core/extension/navigation.dart';
import 'package:clinic/core/extension/show_snack_bar.dart';
import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/app_dialog.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:clinic/features/profile/data/models/patient_profile_model.dart';
import 'package:clinic/features/profile/data/models/updata_patient_profile_request_body_model.dart';
import 'package:clinic/features/profile/presentation/controller/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key, required this.patientProfileData});
  final PatientProfileModel patientProfileData;

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  late String _selectedGender;
  late DateTime _selectedDate;

  late PatientProfileModel profileData;

  @override
  void initState() {
    super.initState();
    profileData = widget.patientProfileData;
    _usernameController.text = profileData.userName;
    _firstNameController.text = profileData.firstName;
    _lastNameController.text = profileData.lastName;
    _addressController.text = profileData.address;
    _emailController.text = profileData.email;
    _dobController.text = _formattedDate(profileData.dateOfBirth);
    _selectedDate = profileData.dateOfBirth;
    _cityController.text = profileData.city;
    _provinceController.text = profileData.province;
    _phoneController.text = profileData.phoneNumber;
    _selectedGender = profileData.gender;
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
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileFailure) {
                    showErrorDialog(context, state.errorModel);
                  }
                  if (state is ProfilePhotoUploadedSuccess) {
                    context.showSnackBar(
                      "Profile photo updated successfully",
                      backgroundColor: AppColors.green,
                    );
                  }
                  if (state is ProfilePhotoRemovedSuccess) {
                    context.showSnackBar(
                      "Profile photo removed successfully",
                      backgroundColor: AppColors.green,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is GetProfilePatientSuccess) {
                    profileData = state.data.profile;
                  }

                  return Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () => _pickProfilePhoto(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child: Image.network(
                              profileData.photoUrl.isEmpty
                                  ? "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"
                                  : profileData.photoUrl,
                              fit: BoxFit.cover,
                              width: 90.w,
                              height: 90.h,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => _deleteProfilePhoto(context),
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                Icons.delete,
                                size: 18.sp,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
                      // to refresh cached data
                      context.read<ProfileCubit>().getPatientProfile();

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

  void _deleteProfilePhoto(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text("Remove Profile Photo"),
          content: const Text(
            "Are you sure you want to remove your profile photo?",
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                dialogContext.pop();
              },
            ),
            TextButton(
              child: const Text("Remove", style: TextStyle(color: Colors.red)),
              onPressed: () async {
                await context.read<ProfileCubit>().removeProfilePhoto();
                if (mounted) {
                  dialogContext.pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _pickProfilePhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (ctx) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take Photo'),
                  onTap: () async {
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                    );
                    if (image != null) {
                      context.read<ProfileCubit>().uploadProfilePhoto(
                        File(image.path),
                      );
                    }
                    if (mounted) Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Choose from Gallery'),
                  onTap: () async {
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      context.read<ProfileCubit>().uploadProfilePhoto(
                        File(image.path),
                      );
                    }
                    if (mounted) context.pop(context);
                  },
                ),
              ],
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
        dateOfBirth: _selectedDate,
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

  String _formattedDate(DateTime date) {
    return "${profileData.dateOfBirth.year}/${profileData.dateOfBirth.month}/${profileData.dateOfBirth.day}";
  }

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
}
