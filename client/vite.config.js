import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'

// https://vitejs.dev/config/
export default defineConfig({
  server: {
    proxy: {
      '/api': {
        target: 'http://54.193.206.20:6868',
        secure: false,
      },
    },
  },
  plugins: [react()],
})
