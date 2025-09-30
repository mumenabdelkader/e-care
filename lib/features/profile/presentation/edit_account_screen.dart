import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/styles/app_styles.dart';
import 'package:clinic/core/theme/app_colors.dart';
import 'package:clinic/core/widgets/custom_button.dart';
import 'package:clinic/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({super.key});

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _idController = TextEditingController(
    text: "1092302",
  );
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
    text: "+6282328277994",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "zhafira@gmail.com",
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

  String _gender = "Female";

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1994, 2, 12),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
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
                        "https://via.placeholder.com/150", // replace with user photo
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

              _buildTextField("Ecare ID", _idController, readOnly: true),
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
                    onPressed: _pickDate,
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
                      groupValue: _gender,
                      onChanged: (val) => setState(() => _gender = val!),
                      title: const Text("Female"),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      value: "Male",
                      groupValue: _gender,
                      onChanged: (val) => setState(() => _gender = val!),
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
              ),
              _buildTextField("City", _cityController),
              _buildTextField("Province", _provinceController),
              _buildTextField("Address", _addressController, maxLines: 2),

              VerticalSpacing(24),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  lable: Text('Save Changes', style: AppStyles.font14W700White),
                  onPressed: () {},
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
