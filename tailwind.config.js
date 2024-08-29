/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./web/templates/**/*.templ'],
  darkMode: 'class',
  theme: {
    extend: {
      transitionDuration: {
        0: '0ms',
        2000: '2000ms',
        4000: '4000ms',
      },
    },
  },
  variants: {
    extend: {},
    display: ['responsive', 'group-hover', 'group-focus'],
  },
  plugins: [],
}
