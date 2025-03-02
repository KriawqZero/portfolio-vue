<!-- src/components/ThemeToggle.vue -->
<script setup>
import { ref, onMounted } from 'vue'

const darkMode = ref(false)

onMounted(() => {
  const savedTheme = localStorage.getItem('theme') || 'light'
  darkMode.value = savedTheme === 'dark'
  document.documentElement.classList.toggle('dark', darkMode.value)
})

// Alternar tema
const toggleTheme = () => {
  darkMode.value = !darkMode.value
  document.documentElement.classList.toggle('dark')
  localStorage.setItem('theme', darkMode.value ? 'dark' : 'light')
}
</script>

<template>
  <!-- Toggle de Tema -->
  <button
    @click="toggleTheme"
    class="cursor-pointer fixed top-6 right-6 z-50 p-3 rounded-full bg-white dark:bg-gray-800 shadow-xl hover:scale-110 transition-all"
  >
    <i
      class="bx text-xl"
      :class="darkMode ? 'bx-sun text-amber-400' : 'bx-moon text-indigo-600'"
    ></i>
  </button>
</template>
