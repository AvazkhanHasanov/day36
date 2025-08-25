import 'package:day_36_darsda1/features/categories/managers/categories_view_model.dart';
import 'package:day_36_darsda1/features/common/widgets/app_bar_with_bottom/bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Bottom extends StatelessWidget implements PreferredSizeWidget {
  const Bottom({super.key, required this.id});

  final int id;

  @override
  Size get preferredSize => Size.fromHeight(39.h);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<CategoriesViewModel>(
        builder: (context, vm, child) {
          return Row(
            children: [
              ...List.generate(
                vm.categories.length,
                    (index) {
                  return AppBarBottom(
                    text: vm.categories[index].title,
                    selectedIndex: index,
                    isSelected: vm.selectedIndex == index,
                    onTap: () {
                      vm.setSelectedIndex(index);
                      context.push(
                        '/recipes/${vm.categories[index].id}?title=${vm.categories[index].title}',
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
