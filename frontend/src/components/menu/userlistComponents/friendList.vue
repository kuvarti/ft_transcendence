<template>
	<div class="w-100 overflow-y-auto">
		<div v-if="store.getters.getUser.isLogin" class="list-group w-100 ">
			<div class="list-group-item list-group-item-action d-flex" v-for="i in 20" :key="i">
				<h4> {{'<Friend Name>'}} </h4>
				<small style="color: green"> Online </small>
			</div>
		</div>
		<div v-else class="d-flex align-items-center justify-content-center">
			<h2>Lutfen Giris Yapiniz</h2>
		</div>
	</div>
</template>

<script setup lang="ts">
import {useStore} from 'vuex'
const store = useStore()
</script>