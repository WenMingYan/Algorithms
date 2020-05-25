import UIKit
/**
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 示例 3:

 输入: 120
 输出: 21

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-integer
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    func reverse(_ x: Int) -> Int {
        var tempX = abs(x);
        var result = 0;
        while tempX > 0 {
        let num = tempX % 10;
        result = result * 10 + num;
        tempX = tempX / 10;
    }
    if x < 0 {
        result = -result;
    }
    if 2147483647 < result || result < -2147483648 {
        return 0;
    }
    return result;
    }
}
