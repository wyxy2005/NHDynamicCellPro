# NHDynamicCellPro
动态UITableViewCell 以两个label为例说明
##### Tips：
不推荐在heightForRow里边调用cellForRow方法，可尝试使用estimateHeightForRow
Usage：
**[引言：](http://longxdragon.github.io/2015/05/26/UITableView%E4%BC%98%E5%8C%96%E6%8A%80%E5%B7%A7/)**
```
UITableView最主要的两个回调方法是：
tableView:cellForRowAtIndexPath:
tableView:heightForRowAtIndexPath:
理想上我们是会认为UITableView会先调用前者，再调用后者，因为这和我们创建控件的思路是一样的，先创建它，再设置它的布局。但实际上却并非如此，我们都知道，UITableView是继承自UIScrollView的，需要先确定它的contentSize及每个Cell的位置，然后才会把重用的Cell放置到对应的位置。所以事实上，UITableView的回调顺序是先多次调用tableView:heightForRowAtIndexPath:以确定contentSize及Cell的位置，然后才会调用tableView:cellForRowAtIndexPath:，从而来显示在当前屏幕的Cell。

举个例子来说：如果现在要显示100个Cell，当前屏幕显示5个。那么刷新（reload）UITableView时，UITableView会先调用100次tableView:heightForRowAtIndexPath:方法，然后调用5次tableView:cellForRowAtIndexPath:方法；滚动屏幕时，每当Cell滚入屏幕，都会调用一次tableView:heightForRowAtIndexPath:、tableView:cellForRowAtIndexPath:方法。

```
示例中使用到了AutoLayout和XIB文件，相关布局不再叙述
重点：
```
// 初始化 prototypeCell 以便复用
    _propertyCell = [_tableView dequeueReusableCellWithIdentifier:@"labelCell"];

```
下边这个委托方法重要的是size.height + 1,这个1像素是为了 separator分界线，不然会有意想不到的情况哦

```
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NHPropertyCell *cell = _propertyCell;
    
    NSString *info = [_dataSource objectAtIndex:[indexPath row]];
    cell.label.text = info;
    cell.subLabel.text = info;
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    CGFloat height = size.height + 1;
    NSLog(@"heigt row : %f",height);
    return height;
}

```

