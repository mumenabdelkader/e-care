import 'package:clinic/core/extension/spacing.dart';
import 'package:clinic/core/networking/api_error_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showApiError(BuildContext context, ApiErrorModel error) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(24.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.grey.shade50],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Error Icon with Animation
              Container(
                padding: EdgeInsets.all(16.sp),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.shade200, width: 2.w),
                ),
                child: Icon(
                  error.icon ?? Icons.error_outline,
                  color: Colors.red.shade600,
                  size: 48.sp,
                ),
              ),
              const VerticalSpacing(20),
              // Title
              Text(
                'Oops! Something went wrong',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpacing(16),

              // Error Message
              if (error.message != null) ...[
                Container(
                  padding: EdgeInsets.all(16.sp),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300, width: 1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 18.sp,
                            color: Colors.grey.shade600,
                          ),
                          const HorizontalSpacing(8),
                          Text(
                            'Error Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpacing(8),
                      ...error.errors!.map((d) {
                        return Text(
                          d,
                          style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 14.sp,
                            height: 1.4.h,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                const VerticalSpacing(20),
              ],

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        side: BorderSide(color: Colors.grey.shade400),
                      ),
                      child: Text(
                        'Dismiss',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const HorizontalSpacing(12),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
