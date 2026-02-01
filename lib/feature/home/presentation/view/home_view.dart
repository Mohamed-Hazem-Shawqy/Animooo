import 'package:animooo/core/services/get_it.dart';
import 'package:animooo/core/widgets/custom_loading_indecator.dart';
import 'package:animooo/feature/category/domain/repos/category_repo_decl.dart';
import 'package:animooo/feature/category/presentation/manager/get_all_category_cubit/get_all_category_cubit.dart';
import 'package:animooo/feature/home/presentation/manager/see_all_button_cubit/sell_all_button_cubit.dart';
import 'package:animooo/feature/home/presentation/widgets/home_view_body.dart';
import 'package:animooo/feature/home/presentation/widgets/see_all_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetAllCategoryCubit(getit<CategoryRepoDecl>())..getAllCategory(),
        ),
        BlocProvider(create: (context) => SellAllButtonCubit()),
      ],
      child: Scaffold(
        body: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
          builder: (context, state) {
            if (state is GetAllCategoryLoading) {
              return const CustomLoadingIndecator();
            } else if (state is GetAllCategoryFailure) {
              return Center(child: Text(state.errMessage));
            } else if (state is GetAllCategorySuccess) {
              return HomeViewBody(categories: state.categories);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
