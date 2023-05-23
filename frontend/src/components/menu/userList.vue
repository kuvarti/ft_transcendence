<template>
	<div class="d-flex justify-content-start">
		<div class="sidemenu rightmenu rightborder" :class="shouldExpandclass">
			<div v-if="!shouldDisplay" @click="switchExpand" class="h-100 w-100 d-flex align-items-center justify-content-center">
				<i class="fa-solid fa-user-group"></i>
			</div>
			<div v-else class="h-100 w-100">
				<!-- todo loginMenu event will be changed -->
				<comps.UL_profileBar @loginMenu="$emit('OpenUser'), switchExpand " :shouldExpand="switchExpand" class="showmyself w-100" />
				<comps.UL_friendList class="showfriends rightborder" />
			</div>
		</div>
	</div>
</template>

<style>
.showmyself{
	height: 20% !important;
}
.showfriends{
	height: 80%;
}

.rightmenu{
	border-width: 1px 1px 1px 0px;
	border-color: white;
	border-style: solid;
}
.rightborder{
	border-radius: 0 20px 20px 0;
}
</style>

<script setup lang="ts">
import { computed, ref, watch } from "vue";
import * as comps from "@/components/menu/menuComponents";
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