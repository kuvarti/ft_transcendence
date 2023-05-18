<template>
	<div>
		<div v-if="!store.getters.getPlaystat" id="menubg" class="mx-auto p-2">
			<mmenu id="mainmenu" class="position-absolute top-50 start-50 translate-middle"/>
		</div>
	</div>
</template>

<style scoped>
#menubg{
	width: 100%;
	height: 100%;
	color: #fff;
	background-color: #37304066;
	position: absolute;
}
#mainmenu{
	display: block;
	border-radius: 5%;
	border: 1px solid #fff;
}
</style>

<script setup lang="ts">
import { computed } from 'vue'
import { useStore } from 'vuex'
import mmenu from "./components/midMenu.vue"
const store = useStore();
console.log(store.getters.getPlaystat)
</script>
