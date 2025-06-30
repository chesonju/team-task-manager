<script setup>
import { onMounted, ref } from 'vue'
import axios from '@/utils/axios'
import { useAuthStore } from '@/store/auth'

const tasks = ref([])
const auth = useAuthStore()

onMounted(async () => {
  const res = await axios.get('/tasks', {
    headers: {
      Authorization: `Bearer ${auth.token}`
    }
  })
  tasks.value = res.data
})
</script>

<template>
  <div>
    <h2>📋 タスク一覧</h2>
    <ul>
      <li v-for="task in tasks" :key="task.id">
        {{ task.title }} - {{ task.status }}
      </li>
    </ul>
  </div>
</template>
