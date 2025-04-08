import { useState } from "react";

function StateSample3(){
  let[text, setText] = useState("");
  let[result, setResult] =useState("내용을 입력하세요.");
  return(
    <div>
      <input type="text" onChange={(e)=>setText(e.target.value)}/>
      <button onClick={()=>setResult(text)}>등록</button >
      <h1>{result}</h1>
    </div>
  )
}

export default StateSample3;