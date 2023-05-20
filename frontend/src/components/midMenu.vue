<template>
	<div class="menu d-flex justify-content-center">
		<div class="row h-100 w-100">
			<userMenu class="col-4 p-0 m-0"/>
			<mainMenu class="col-4 p-0 m-0"/>
			<userList class="col-4 p-0 m-0"/>
		</div>
	</div>
</template>

<style>
.menu{
	position: fixed;
	display: flex;
	height: 100%;
	width: 100%;
}
</style>

<script setup lang="ts">
import mainMenu from "./menu/mainMenu.vue"
import userMenu from "./menu/userSettings.vue"
import userList from "./menu/userList.vue"
// @ts-ignore
import { useStore } from "vuex"
import { onUnmounted } from "vue"

const store = useStore()

onUnmounted(() => {
	store.commit('_setloginstat', true)
	store.commit('_setLogin', { profile: 'https://html.com/wp-content/uploads/flamingo.jpg'})
})
</script>