import 'package:flutter/material.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Center(
        child: Container(
          height: 36,
          width: 36,
          decoration: BoxDecoration(
            color: const Color(0xff12a63e),
            borderRadius: BorderRadius.circular(18)
          ),
        ),
      ),
      title: const Row(
        children: [
          Text("+998930720405",style: TextStyle(
            color: Color(0xff1f2025),
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
          SizedBox(width: 4,),
          Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Color(0xff6d6e73),)
        ],
      ),
      actions: [


        Image.asset("assets/icon/costumer_service.png",height: 24,width: 24,color:const Color(0xff6d6e73) ,),
        const SizedBox(width: 8,),
        const Badge(
          label: Text("8"),
          child: Icon(Icons.notifications_sharp,color:Color(0xff6d6e73)),
        ),
        const SizedBox(width: 16,)

      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
