// leetsums.cpp: 定义控制台应用程序的入口点。
//

#include "stdafx.h"
#include<vector>
using namespace std;
class Solution {
public:
	vector<int> twoSum(vector<int>& nums, int target) {
		std::vector<int>::size_type totall = nums.size();
		std::vector<int>::size_type a = 0;
		std::vector<int>::size_type b = a + 1;
		vector<int> res(2);
		while (1) {
			b = a + 1;
			while ( b < nums.size()-1) {
				if (nums[a] + nums[b] == target)
					break;
				b++;
			}
			if (nums[a] + nums[b] == target)
				break;
			a++;
		}
		res[0] = (int)a;
		res[1] = (int)b;
		return res;
	}
};

int main()
{
	int c[3]= { 3,2,4 };
	vector<int> tes(c, c + 3);
	Solution bb;
	vector<int> res(2);
	res = bb.twoSum(tes, 6);
	return 0;
}

