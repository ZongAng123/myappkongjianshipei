//
//5.7.1 FittedBox

/*  5.7.1 FittedBox
*
* const FittedBox({
  Key? key,
  this.fit = BoxFit.contain, // 适配方式
  this.alignment = Alignment.center, //对齐方式
  this.clipBehavior = Clip.none, //是否剪裁
  Widget? child,
})
*
* 适配原理
* 1、FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，
* 即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
* 2、FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
* 3、FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。
*
*
*
* */