<template>
  <div class="login">
    <h2>ログイン</h2>
    <form @submit.prevent="login">
      <input v-model="email" placeholder="Email" />
      <input v-model="password" type="password" placeholder="Password" />
      <button type="submit">ログイン</button>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import axios from '@/utils/axios'
import { useAuthStore } from '@/store/auth'
import { useRouter } from 'vue-router'

const email = ref('')
const password = ref('')
const auth = useAuthStore()
const router = useRouter()

const login = async () => {
  try {
    const res = await axios.post('/login', { email: email.value, password: password.value })
    auth.setToken(res.data.token)
    auth.setUser(res.data.user)
    router.push('/tasks')
  } catch (err) {
    alert('ログイン失敗')
  }
}
</script>
