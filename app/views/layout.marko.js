function create(__helpers) {
  var str = __helpers.s,
      empty = __helpers.e,
      notEmpty = __helpers.ne,
      escapeXml = __helpers.x,
      __loadTag = __helpers.t,
      layout_placeholder = __loadTag(require("marko/taglibs/layout/placeholder-tag"));

  return function render(data, out) {
    out.w("<!doctype html><html lang=\"en\"><head><meta charset=\"UTF-8\"><meta name=\"viewport\" content=\"width=device-width\"><title>" +
      escapeXml(data.title) +
      "</title><link rel=\"stylesheet\" href=\"/css/style.css\">");

    if (out.global.locals.ENV_DEVELOPMENT) {
      out.w("<script src=\"http://localhost:35729/livereload.js\"></script>");
    }

    out.w("</head><body>");

    layout_placeholder({
        name: "body",
        content: data.layoutContent
      }, out);

    out.w("</body></html>");
  };
}

(module.exports = require("marko").c(__filename)).c(create);
