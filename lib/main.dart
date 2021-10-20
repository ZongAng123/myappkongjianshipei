import 'package:flutter/material.dart';

// 5.7 空间适配 FittedBox

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '空间适配FittedBox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
              * 子组件大小超出了父组件大小时，如果不经过处理的话 Flutter 中就会显示一个溢出警告并在控制台打印错误日志，比如下面代码会导致溢出：
              * 可以看到右边溢出了 45 像素。
              * */
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 30.0),
            //   child: Row(
            //     children: [Text('xx'*30)],
            //   ),
            // ),
            wContainer(BoxFit.none),
            Text("zongang"),
            wContainer(BoxFit.contain),
            Text('Flutter中国'),
          ],
        ),
      ),
    );
  }
}

Widget wContainer(BoxFit boxFit){
  /**
   * 因为父Container要比子Container小，所以当没有指定任何适配方式时，子组件会按照其真实大小进行绘制，所以第一个蓝色区域会超出父组件的空间，
   * 因而看不到红色区域。第二个我们指定了适配方式为 BoxFit.contain，含义是按照子组件的比例缩放，尽可能多的占据父组件空间，
   * 因为子组件的长宽并不相同，所以按照比例缩放适配父组件后，父组件能显示一部分。
   *
   * */
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
    //  子容器超过父容器大小
      child: Container(width: 60, height: 70, color: Colors.blue,),
    ),
  );
}

/*
* 要注意一点，在未指定适配方式时，虽然 FittedBox 子组件的大小超过了 FittedBox 父 Container 的空间，
* 但FittedBox 自身还是要遵守其父组件传递的约束，所以最终 FittedBox 的本身的大小是 50×50，这也是为什么蓝色会和下面文本重叠的原因，
* 因为在布局空间内，父Container只占50×50的大小，接下来文本会紧挨着Container进行布局，而此时Container 中有子组件的大小超过了自己，
* 所以最终的效果就是绘制范围超出了Container，但布局位置是正常的，所以就重叠了。
* 如果我们不想让蓝色超出父组件布局范围，那么可以可以使用 ClipRect 对超出的部分剪裁掉即可：
*  ClipRect( // 将超出子组件布局范围的绘制内容剪裁掉
  child: Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      child: Container(width: 60, height: 70, color: Colors.blue),
    ),
  ),
);
*
* 关于 BoxFit 的各种适配规则和 Image 的 fix 属性指定是一样的
*
* */











