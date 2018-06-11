

<div id="markerdown">
    <textarea style="display:none;" placeholder="markdown语言">### HashMap原理详解（基于jdk1.8）
> HashMap原理详解，有兴趣的同学可以看下。有错误的地方也希望大佬们能指点下。

HashMap的内部存储是一个数组（bucket），数组的元素Node实现了Map.Entry接口（hash, key, value, next），
当next非空时候会指向定位相同的另外一个Entry。这里借用大佬一张图
![这里写图片描述](https://img-blog.csdn.net/20180408131036521?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

###HashMap容量大小、负载因子、阀值

在java api中，HashMap的容量定义为16，而阀值定义为0.75。HashMap容量大小指的是内部存储的这个数组bucket大小，负载因子为0.75。阀值=容量大小*负载因子，当数组中的entity的个数大于阀值的时候，HashMap就会进行扩容，调整为当前大小的两倍同时，初始化容量的大小也是2的次幂（大于等于设定容量的最小次幂），则bucket的大小在扩容前后都将是2的次幂（非常重要，resize时能带来极大便利）。

HashMap源码：
```
 /**
  * 初始容量大小 定义为final 必须为2的次幂
  */
 static final int DEFAULT_INITIAL_CAPACITY = 1 << 4; // aka 16
 /**
  * 加载因子 定义为final
  */
  static final float DEFAULT_LOAD_FACTOR = 0.75f;

```
####为什么HashMap初始容量是16？（深入）

HashMap中有种情况称为Hash碰撞，指的是存数据的时候，两个数据值不一样，但是hashcode一样，也就是说一个hashcode对应多个值，（面试一题：hashcode相同值不一定相同，值相同hashcode一定相同），所以在HashMap中为了尽量减少hash值得碰撞，需要实现一个尽量
均匀分布的hash函数。

> 为什么HashMap初始容量是16？
公式jdk中的：index = e.hash & (newCap - 1)

举例证明：假设是容量16
key | 十进制 | 二进制|与初始量16的与（&）操作
:----------- | :-----------: | -----------:
16（初始量）         | 15| 1111
admin| 171271319| 1010001101010110010010010111|0111
hello| 288970072| 10001001110010101010101011000|1000
name| 6071694| 10111001010010110001110|1110

假设是容量10
key | 十进制 | 二进制|与初始量16的与（&）操作
:----------- | :-----------: | -----------:
10（初始量）         | 9| 1001
admin| 171271319| 1010001101010110010010010111|0001
hello| 288970072| 10001001110010101010101011000|1000
name| 6071694| 10111001010010110001110|1000

怎么样，同学们看出规律来了没，十进制结果碰撞太容易了。最终原因还是因为二进制的与运算，同位1可为1，否则为0。初始容量为16时候，十进制为（16-1=15）1111。相当于几乎只与key.hash有关了（当然除非是两个key的hash后四位都是1111就会产生碰撞了）。其他的也是试试，比如初始量为8,5,12什么的都可以，但是16才最能减少碰撞了。当然低4位也是比较容易发生碰撞的，所以设计者在hash方法上做了手脚（看下面hash方法，在hash上使用了异或一下，节省了开支，又步骤简单）

###HashMap的hash方法(混乱函数)
```
 static final int hash(Object key) {
        int h;
        return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);
    }
```
这里jdk为了保证良好的hashcode，对key进一步使用了hashcode方法。使用的是自身的高16位与低16位进行异或，进步一散列hash,其中hashcode是Object的方法，注意这里的多态使用。
key | 调用hashcode() |**然后**位移16 |hash值|下标（公式）计算|下标十进制
:----------- | :-----------: | -----------:
admin| 101100001100000001101001111|10110000110|101100001100000011011001001|1001|9
图解：这图画的我好尴尬啊
![这里写图片描述](https://img-blog.csdn.net/20180408113834581?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)

###HashMap的put、get

> put方法引发的思考

 1. 在一个长度为16的数组中，元素到底是存储在哪里的呢。其实这个问题在hash方法里面我就解说了，获取了hash值之后，会与数组的长度作一个与操作，最终获取到的是一个低四位的二进制，如上图中的1001，最终下标就是9.
 2. 哪怕经过了hash异或，还是有可能会发生hash碰撞，那么HashMap是怎么处理这些hash值相同的元素的呢。一张比较丑的图来解释下hashmap内部的构造
 ![这里写图片描述](https://img-blog.csdn.net/20180408134638725?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI2MTE4NjAz/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70)
 以我们的角度来看，这个Map横向是数组形式，纵向是一条条链表形式，存储位置算法是根据hash(key)%len得到的，比如hash（key）=30, 30%16=14，存的位置为14下标。hash（key）=14,14%16=14，这个时候之前的30就会被挤下去，而14元素会取代链表第一个位置。30就变成了存储在第二个位置。这个就很好的解释了Node元素里面的next，指向了定位相同的一个Entity。当链表长度大于8 的时候，链表就会转换成红黑树结构（这其实是为了优化速度），时间复杂度变成了log(n)。
 **PUT方法源码解读**


```
final V putVal(int hash, K key, V value, boolean onlyIfAbsent,
                   boolean evict) {
        Node<K,V>[] tab; Node<K,V> p; int n, i;
        //table数组为空，重新分配内存空间
        if ((tab = table) == null || (n = tab.length) == 0)
            n = (tab = resize()).length;
            //tab[数组下标]的值为null的时候，这个值重新初始化Node节点，并放置在这个位置
        if ((p = tab[i = (n - 1) & hash]) == null)
            tab[i] = newNode(hash, key, value, null);
        else {//如果这个坐标数组有数据的话
            Node<K,V> e; K k;
            //如果key相同 key的hash也相同 两个节点相等
            if (p.hash == hash &&
                ((k = p.key) == key || (key != null && key.equals(k))))
                e = p;
                //如果该节点是代表红黑树的节点，调用红黑树的插值方法
            else if (p instanceof TreeNode)
                e = ((TreeNode<K,V>)p).putTreeVal(this, tab, hash, key, value);
            else {
                for (int binCount = 0; ; ++binCount) {
                    if ((e = p.next) == null) {
                        p.next = newNode(hash, key, value, null);
                        //当单个桶（bucket）>=（8-1=7）的时候 调用treeifyBin转换为红黑树结构
                        if (binCount >= TREEIFY_THRESHOLD - 1) // -1 for 1st
                            treeifyBin(tab, hash);
                        break;
                    }
                    if (e.hash == hash &&
                        ((k = e.key) == key || (key != null && key.equals(k))))
                        break;
                    p = e;
                }
            }
            if (e != null) { // existing mapping for key
                V oldValue = e.value;
                if (!onlyIfAbsent || oldValue == null)
                    e.value = value;
                afterNodeAccess(e);
                return oldValue;
            }
        }
        ++modCount;
        if (++size > threshold)
            resize();
        afterNodeInsertion(evict);
        return null;
    }
```
**get方法解读**

```
 final Node<K,V> getNode(int hash, Object key) {
        Node<K,V>[] tab; Node<K,V> first, e; int n; K k;
        if ((tab = table) != null && (n = tab.length) > 0 &&
            (first = tab[(n - 1) & hash]) != null) {
                // 判断第一个节点是不是就是需要的
            if (first.hash == hash && // always check first node
                ((k = first.key) == key || (key != null && key.equals(k))))
                return first;
            if ((e = first.next) != null) {
                 // 判断是否是红黑树
                if (first instanceof TreeNode)
                    return ((TreeNode<K,V>)first).getTreeNode(hash, key);
                do {
                     // 链表遍历
                    if (e.hash == hash &&
                        ((k = e.key) == key || (key != null && key.equals(k))))
                        return e;
                } while ((e = e.next) != null);
            }
        }
        return null;
    }

```
## 电面一题：HashMap在多线程中是采取了什么机制？ ##
楼主想了好久没答上来，有知道得同行可以在评论区留言

</textarea>

</div>

<#--md js引入-->
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="static/assets/js/amazeui.ie8polyfill.min.js"></script>

<script src="static/md/js/lib/marked.min.js"></script>
<script src="static/md/js/lib/prettify.min.js"></script>
<script src="static/md/js/lib/raphael.min.js"></script>
<script src="static/md/js/lib/underscore.min.js"></script>
<script src="static/md/js/lib/sequence-diagram.min.js"></script>
<script src="static/md/js/lib/flowchart.min.js"></script>
<script src="static/md/js/lib/jquery.flowchart.min.js"></script>
<script src="static/md/js/editormd.js"></script>
<script type="text/javascript">
    testEditormdView2 = editormd.markdownToHTML("markerdown", {
        htmlDecode      : "style,script,iframe",  // you can filter tags decode
        emoji           : true,
        taskList        : true,
        tex             : true,  // 默认不解析
        flowChart       : true,  // 默认不解析
        sequenceDiagram : true,  // 默认不解析
    });
</script>