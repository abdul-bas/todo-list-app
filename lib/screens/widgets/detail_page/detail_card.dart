import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({super.key,required this.icon,required this.title,required this.value});
  final String title;
    final String value;
    final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(icon,),
        title: Text(title,style: TextStyle(color: AppColors.hint),),
        subtitle: Text(value),
      ),
    );
  }
}
