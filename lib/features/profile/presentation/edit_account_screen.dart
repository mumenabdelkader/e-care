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
  String imageKey = DateTime.now().millisecondsSinceEpoch.toString();

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
    final textTheme = Theme.of(context).textTheme;

    final surfaceColor = Theme.of(context).colorScheme.surface;

    final hintColor = Theme.of(context).hintColor;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account", style: textTheme.displaySmall),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileFailure) {
                    showErrorDialog(context, state.errorModel);
                  } else if (state is GetProfilePatientSuccess) {
                    context.showSnackBar(
                      "Photo updated successfully",
                      backgroundColor: AppColors.green,
                    );

                    setState(() {
                      profileData = state.data.profile;
                      imageKey =
                          DateTime.now().millisecondsSinceEpoch.toString();
                    });
                  }
                },
                builder: (context, state) {
                  final defaultImageUrl =
                      'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png';
                  final imageUrl =
                      profileData.photoUrl.isNotEmpty
                          ? profileData.photoUrl
                          : defaultImageUrl;

                  return Center(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () => _pickProfilePhoto(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(90.r),
                            child:
                                state is ProfileLoading
                                    ? CircleAvatar(
                                      radius: 45.r,

                                      backgroundColor: surfaceColor,
                                      child: CircularProgressIndicator(
                                        color: hintColor,
                                      ),
                                    )
                                    : Image.network(
                                      imageUrl,
                                      key: ValueKey('$imageUrl-$imageKey'),
                                      width: 90.w,
                                      height: 90.h,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Icon(
                                          Icons.account_circle,
                                          size: 90.sp,

                                          color: hintColor,
                                        );
                                      },
                                      loadingBuilder: (
                                        context,
                                        child,
                                        loadingProgress,
                                      ) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Container(
                                          width: 90.w,
                                          height: 90.h,
                                          decoration: BoxDecoration(
                                            color: surfaceColor,
                                            borderRadius: BorderRadius.circular(
                                              90.r,
                                            ),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: hintColor,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                          ),
                        ),
                        if (profileData.photoUrl.isNotEmpty)
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
                                    color:
                                        Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
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

              Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Personal",
                  style: textTheme.titleLarge?.copyWith(color: hintColor),
                ),
              ),
              VerticalSpacing(16),
              _buildTextField(
                "Username",
                _usernameController,
                textTheme,
                surfaceColor,
              ),
              _buildTextField(
                "First Name",
                _firstNameController,
                textTheme,
                surfaceColor,
              ),
              _buildTextField(
                "Last Name",
                _lastNameController,
                textTheme,
                surfaceColor,
              ),

              Align(
                alignment: Alignment.centerLeft,

                child: Text("Date of Birth", style: textTheme.titleSmall),
              ),
              VerticalSpacing(4),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                style: textTheme.bodyMedium,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today_outlined, color: hintColor),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  filled: true,

                  fillColor: surfaceColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              VerticalSpacing(16),

              Align(
                alignment: Alignment.centerLeft,

                child: Text("Gender", style: textTheme.titleSmall),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      value: "Female",
                      groupValue: _selectedGender,
                      onChanged:
                          (val) => setState(() => _selectedGender = val!),
                      title: Text("Female", style: textTheme.bodyMedium),
                      activeColor: AppColors.primary,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: "Male",
                      groupValue: _selectedGender,
                      onChanged:
                          (val) => setState(() => _selectedGender = val!),
                      title: Text("Male", style: textTheme.bodyMedium),
                      activeColor: AppColors.primary,
                    ),
                  ),
                ],
              ),
              VerticalSpacing(20),

              Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Contact",
                  style: textTheme.titleLarge?.copyWith(color: hintColor),
                ),
              ),
              VerticalSpacing(16),

              _buildTextField(
                "Phone Number",
                _phoneController,
                textTheme,
                surfaceColor,
                keyboardType: TextInputType.phone,
              ),
              _buildTextField(
                "Email",
                _emailController,
                textTheme,
                surfaceColor,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
              ),
              _buildTextField("City", _cityController, textTheme, surfaceColor),
              _buildTextField(
                "Province",
                _provinceController,
                textTheme,
                surfaceColor,
              ),
              _buildTextField(
                "Address",
                _addressController,
                textTheme,
                surfaceColor,
                maxLines: 2,
              ),

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

                      context.read<ProfileCubit>().getPatientProfile();

                      context.pop();
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      lable:
                          state is ProfileLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.white,
                                ),
                              )
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

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    TextTheme textTheme,
    Color surfaceColor, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool readOnly = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: textTheme.titleSmall),
          VerticalSpacing(4),
          CustomTextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            readOnly: readOnly,
            style: textTheme.bodyMedium,
            decoration: InputDecoration(
              filled: true,

              fillColor: surfaceColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),

              hintStyle: textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).hintColor,
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
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: Theme.of(context).colorScheme.surface,
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

  void _deleteProfilePhoto(BuildContext context) {
    showDialog(
      context: context,

      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            "Remove Profile Photo",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            "Are you sure you want to remove your profile photo?",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                "Cancel",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
              onPressed: () {
                dialogContext.pop();
              },
            ),
            TextButton(
              child: const Text(
                "Remove",
                style: TextStyle(color: AppColors.red),
              ),
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
                  leading: Icon(
                    Icons.camera_alt,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    'Take Photo',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
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
                  leading: Icon(
                    Icons.photo_library,
                    color: Theme.of(context).hintColor,
                  ),
                  title: Text(
                    'Choose from Gallery',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () async {
                    final image = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    if (image != null) {
                      context.read<ProfileCubit>().uploadProfilePhoto(
                        File(image.path),
                      );
                    }
                    if (mounted) context.pop();
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      final updatedProfile = UpdataPatientProfileRequestBodyModel(
        userName: _usernameController.text.trim(),
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        dateOfBirth: _selectedDate,
        gender: _selectedGender,
        phoneNumber: _phoneController.text.trim(),
        city: _cityController.text.trim(),
        province: _provinceController.text.trim(),
        address: _addressController.text.trim(),
      );

      context.read<ProfileCubit>().updatePatientPprofile(updatedProfile);
    }
  }
}
