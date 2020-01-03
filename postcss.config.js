const purgecss = require("@fullhuman/postcss-purgecss");
const tailwindcss = require("tailwindcss")("tailwind.config.js");

class TailwindExtractor {
    static extract(content) {
        return content.match(/[A-Za-z0-9-_:\/]+/g) || [];
    }
}

module.exports = {
    plugins: [
        require("tailwindcss"),
        require("autoprefixer"),
        require("postcss-import"),
        require("postcss-preset-env"),
        require("cssnano"),
        purgecss({
            extractors: [
                {
                    extensions: ["elm", "html", "js"],
                    extractor: TailwindExtractor
                }
            ],
            content: ["./src/**/*.elm", "index.js"],
            whitelist: ["html", "body"]
        }),
    ]
}