/**
 * @Author : yanfeng
 * @Date : 2024/5/10
 * @Time : 16:44
 * @Desc :
 */

export class HomeViewModel {
  // 模拟请求首页接口
  static httpGetHomePageData(): Promise<string> {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        const randomNumber = Math.random();
        if (randomNumber > 0.5) {
          resolve("大于0.5的值：" + randomNumber);
        } else {
          resolve("小于了。。。。。")
          // reject(new Error('Random number is too small'));
        }
      }, 1000);
    });
  }

  static async getHomeData() {
    let result = await HomeViewModel.httpGetHomePageData()
    return result
  }

}
 
 