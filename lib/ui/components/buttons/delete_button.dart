import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:povarenok_mobile/ui/components/modals/delete_dialog.dart';

class DeleteButton extends StatelessWidget {
  final int recipeId;

  const DeleteButton({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showDeleteDialog(context, recipeId);
        // Navigator.of(context).pop();
        // await userModel.deleteRecipe(recipeId);
        // recipesModel.update(categoriesModel.currentCategory);
      },
      icon: Icon(
        CupertinoIcons.trash,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 32.r,
      ),
    );
  }
}
