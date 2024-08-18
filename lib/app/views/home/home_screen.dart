import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jokee_app/app/core/constant/app_constant.dart';
import 'package:jokee_app/app/core/themes/themes.dart';
import 'package:jokee_app/app/views/home/bloc/home_bloc.dart';
import 'package:jokee_app/app/views/home/bloc/home_event.dart';
import 'package:jokee_app/app/views/home/bloc/home_state.dart';
import 'package:jokee_app/app/widgets/custom_appbar.dart';
import 'package:jokee_app/app/widgets/custom_button.dart';
import 'package:jokee_app/app/widgets/dialog_uitls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeEventInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Image.asset(
            AppImages.logo,
            height: 38,
            width: 38,
            fit: BoxFit.fill,
          ),
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Handcrafted by", style: AppTextStyles.text10.copyWith(color: AppColors.gray89)),
              Text("Jim HLS", style: AppTextStyles.text10),
            ],
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.avatar),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (prev, curr) => prev.isVoteLoading != curr.isVoteLoading,
        listener: (context, state) {
          DialogUtils.showLoadingDialog(isShow: state.isLoading);
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 120,
                color: AppColors.green2E,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      AppConstant.note1,
                      style: AppTextStyles.text20.copyWith(color: AppColors.white),
                    ),
                    Text(
                      AppConstant.note2,
                      style: AppTextStyles.text14.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              if (state.isLoading)
                const Expanded(child: Center(child: CircularProgressIndicator()))
              else if (state.isComeBackLater)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Center(child: Text(AppConstant.comeBackLater, style: AppTextStyles.text14.copyWith(color: AppColors.gray54))),
                  ),
                )
              else ...[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Text(
                        state.joke,
                        style: AppTextStyles.text14.copyWith(color: AppColors.gray54),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      title: "This is Funny!",
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: AppColors.blue02,
                      textStyle: AppTextStyles.text14.copyWith(color: AppColors.white),
                      onTap: () {
                        context.read<HomeBloc>().add(HomeEventVote(value: true));
                      },
                    ),
                    const SizedBox(width: 36),
                    CustomButton(
                      title: "This is not funny.",
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: AppColors.green2E,
                      textStyle: AppTextStyles.text14.copyWith(color: AppColors.white),
                      onTap: () {
                        context.read<HomeBloc>().add(HomeEventVote(value: false));
                      },
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 36),
              const Divider(color: AppColors.grayCC, thickness: 0.5),
              _buildFooter(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            AppConstant.footer,
            style: AppTextStyles.text12.copyWith(color: AppColors.gray80),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(AppConstant.copyright, style: AppTextStyles.text14.copyWith(color: AppColors.gray73)),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
