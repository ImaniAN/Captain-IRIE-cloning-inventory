import { supabase } from "$lib/supabaseClient";

export async function load() {
  const { data } = await supabase.from("strain").select();
  return {
	strains: data ?? [],

	const { data1 } = await supabase.from("strain").select();
	return {
	  strains: data1 ?? [],
  };
}