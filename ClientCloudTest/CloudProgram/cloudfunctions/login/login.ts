let myHandler = async function (event, context, callback, logger) {
  logger.info(event);

  // do something here
  //实现一个随机数
  let random = Math.random().toFixed(4)
  callback({
    code: 0,
    desc: "Success." + random
  });
};

export { myHandler };