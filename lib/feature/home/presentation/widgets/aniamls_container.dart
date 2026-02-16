import 'dart:io';

import 'package:animooo/core/entity/get_all_animal_entity.dart';
import 'package:animooo/core/utils/app_colors.dart';
import 'package:animooo/core/utils/app_fonts_style.dart';
import 'package:animooo/core/utils/app_navigation.dart';
import 'package:animooo/core/utils/app_padding.dart';
import 'package:animooo/core/utils/route_manager.dart';
import 'package:animooo/feature/auth/presentation/manager/Auth_cubit/auth_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/delete_animal_cubit/delete_animal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AniamlsContainer extends StatelessWidget {
  const AniamlsContainer({super.key, required this.animal});
  final GetAllAnimalEntity animal;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: AppSpacing.w16),
      decoration: BoxDecoration(
        color: AppColors.steelWhiteF6F6F6,

        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppSpacing.w8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animal.name,
                      style: AppFonts.urbanistSemiBold12.copyWith(
                        color: AppColors.black000000,
                      ),
                    ),
                    SizedBox(height: AppSpacing.h4),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Text(
                          'create by ${context.read<AuthCubit>().currenUser?.firstName ?? ''} ${context.read<AuthCubit>().currenUser?.lastName ?? ''}',
                          style: AppFonts.urbanistRegular12.copyWith(
                            color: AppColors.greyish999999,
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '${animal.price}\$',
                  style: AppFonts.urbanistSemiBold12.copyWith(
                    color: AppColors.primary04332D,
                  ),
                ),

                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'edit') {
                      AppNavigation.pushNamed(context, RouteName.addNewAnimal,
                          arguments: animal);
                    } else if (value == 'delete') {
                      context.read<DeleteAnimalCubit>().deleteAnimal(
                        animal.animalid ?? 00,
                      );
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            width: double.infinity,
            child:
                animal.image.startsWith('file') || animal.image.startsWith('/')
                ? Image.file(File(animal.image), fit: BoxFit.cover)
                : Image.network(animal.image, fit: BoxFit.cover),
          ),

          /// Description
          Padding(
            padding: EdgeInsets.all(AppSpacing.w10),
            child: Text(
              animal.description,
              style: AppFonts.urbanistRegular12.copyWith(
                color: AppColors.black000000,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
