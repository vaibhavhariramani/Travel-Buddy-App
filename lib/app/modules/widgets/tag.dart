// class Tag extends ConsumerWidget {
//   final String? text;
//   final VoidCallback? onTap;
//   const Tag({
//     Key? key,
//     this.text,
//     this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       overlayColor: MaterialStateProperty.all(Colors.transparent),
//       hoverColor: Colors.transparent,
//       focusColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       onTap: onTap,
//       child: Container(
//         child: FittedBox(
//           child: Container(
//             margin: EdgeInsets.only(right: 6, bottom: 6),
//             padding: EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//             child: Text(
//               "$text",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               borderRadius: BorderRadius.circular(4),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
