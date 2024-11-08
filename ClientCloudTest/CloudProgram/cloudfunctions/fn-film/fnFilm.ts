import axios from 'axios'
/*
 * 云函数
 */
let myHandler = async function (event, context, callback, logger) {
  logger.info(event);
  //开发环境 运行环境
  logger.info(context.env.value)
  //可以做一些数据的聚合
  //调用一些其他的互联网的接口，产生一些数据，聚合提供给我们的app使用
  // do something here
  let ret = await axios({
    url: 'https://m.maizuo.com/gateway?cityId=430100&pageNum=1&pageSize=10&type=1&k=2337984',
    headers:{"x-host": "mall.film-ticket.film.list" }
  })
  logger.info(ret.data.data.films)
  //返回给客户端的数据，就通过这个回调返回
  //
  callback({
    code: 0,
    // desc: "Success." + "xjq"
    films:ret.data.data.films
  });
};

export { myHandler };