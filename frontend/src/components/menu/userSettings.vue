<template>
	<div class="d-flex justify-content-end">
		<div class="sidemenu leftmenu leftborder" :class="shouldExpandclass">
			<div v-if="!shouldDisplay" @click="switchExpand" class="h-100 w-100 d-flex align-items-center justify-content-center">
				<i class="fa-solid fa-user"></i>
			</div>
		</div>
	</div>
</template>

<style>
.leftmenu{
	border-width: 1px 0px 1px 1px;
	border-color: white;
	border-style: solid;
	border-radius: 20px 0 0 20px;
}
</style>

<script setup lang="ts">
import { useStore } from "vuex"
import { computed, ref, watch } from "vue";
const store = useStore();
const shouldExpand = ref(false)
const shouldExpandclass = computed(() => {
	if (shouldExpand.value)
		return 'openedMenu'
	else
		return 'closedMenu'
})
const shouldDisplay = ref(false)
watch(shouldExpand, () => {
	if (shouldExpand.value) {
		setTimeout(() => {
			shouldDisplay.value = true
		}, 500)
	} else {
		setTimeout(() => {
			shouldDisplay.value = false
		}, 100)
	}
})
const switchExpand = () => {
	shouldExpand.value = !shouldExpand.value
}
</script>